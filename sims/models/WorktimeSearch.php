<?php

namespace sims\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use sims\models\Worktime;

/**
 * WorktimeSearch represents the model behind the search form about `sims\models\Worktime`.
 */
class WorktimeSearch extends Worktime
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'pr_id', 'person_id', 'day_time', 'commit_time'], 'integer'],
            [['pr_name', 'notes'], 'safe'],
            [['worktime'], 'number'],
        ];
    }

    /**
     * @inheritdoc
     */
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
        $query = Worktime::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            'pr_id' => $this->pr_id,
            'person_id' => $this->person_id,
            'day_time' => $this->day_time,
            'worktime' => $this->worktime,
            'commit_time' => $this->commit_time,
        ]);

        $query->andFilterWhere(['like', 'pr_name', $this->pr_name])
            ->andFilterWhere(['like', 'notes', $this->notes]);

        return $dataProvider;
    }
}
