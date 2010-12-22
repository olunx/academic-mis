package cn.gdpu.vo;

import java.util.Set;

public class Institute {
        private int id;
        private String name;
        private Set<Classes> classes;
        private Set<Institute> teachers;
        private String remark;
        
        public int getId() {
                return id;
        }
        public void setId(int id) {
                this.id = id;
        }
        public String getName() {
                return name;
        }
        public void setName(String name) {
                this.name = name;
        }
        public Set<Classes> getClasses() {
                return classes;
        }
        public void setClasses(Set<Classes> classes) {
                this.classes = classes;
        }
        public Set<Institute> getTeachers() {
                return teachers;
        }
        public void setTeachers(Set<Institute> teachers) {
                this.teachers = teachers;
        }
        public String getRemark() {
                return remark;
        }
        public void setRemark(String remark) {
                this.remark = remark;
        }
        
}