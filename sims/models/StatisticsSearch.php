<?php

namespace sims\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use sims\models\Statistics;
use yii\db\Query;

/**
 * StatisticsSearch represents the model behind the search form about `sims\models\Statistics`.
 */
class StatisticsSearch extends Statistics
{
    public $start_time;
    public $end_time;

    public function rules()
    {
        return [
            [['y_month', 'pr_name', 'start_time','end_time','contain'], 'safe'],
        ];
    }

    public function attributeLabels()
    {
        return [
            'start_time'=>'开始时间',
            'end_time'=>'结束时间',
            'y_month' => '工时日期',
            'seo_time' =>'截止时间',
            'pr_name' => '项目名称',
            'contain' => '记录',
        ];
    }

    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Statistics::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere(['like', 'pr_name', $this->pr_name])->andFilterWhere(['!=','contain','0']);

        if(!empty($this->start_time))                                     //$start_time不为空
        {
            if(empty($this->end_time)){                                   //$end_time为空
                $query->andFilterWhere(['>=','y_month',$this->start_time]);
            }
            else{
                $query->andFilterWhere(['between', 'y_month', $this->start_time,$this->end_time]);
            }
        }else{                                                            //$start_time为空
            if(!empty($this->end_time)){                                   //$end_time不为空
                $query->andFilterWhere(['<=','y_month',$this->end_time]);
            }
        }
        return $dataProvider;
    }
}
