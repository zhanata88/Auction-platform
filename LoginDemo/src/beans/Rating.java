
package beans;

import java.io.Serializable;


public class Rating implements Serializable{

    public Rating(double a, String comment) {
        this.a = a;
        this.comment = comment;
    }
    private double a;
    private String comment;

    public double getA() {
        return a;
    }

    public void setA(double a) {
        this.a = a;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
    
    
    
    
}
