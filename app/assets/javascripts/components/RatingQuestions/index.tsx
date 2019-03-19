import * as React from "react";
import * as styles from "./index.module.scss";
import RatingQuestion from "./RatingQuestion";

interface Question {
  id: string;
  title: string;
}

interface RatingQuestionsProps {
  questions: Question[];
}

class RatingQuestions extends React.Component<RatingQuestionsProps, {}> {
  render() {
    return (
      <div className={styles.list} data-automation-id="questions-list">
        {this.props.questions.map(question => (
          <RatingQuestion key={question.id} {...question} />
        ))}
        <h2>HELLOOOOOOO</h2>
      </div>
    );
  }
}

export default RatingQuestions;
