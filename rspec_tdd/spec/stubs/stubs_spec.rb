require 'student'
require 'course'

  describe 'Stub' do
    it '#has_fineshed?' do
      
      # Setup
      student = Student.new
      course = Course.new

      allow(student).to receive(:has_finished?)
        .with(an_instance_of(Course))
        .and_return(true)
      
      # Exercise
      finished_course = student.has_finished?(course)
     
      # Verify
      expect(finished_course).to be_truthy
    end

    it 'Argumentos Dinâmicos' do
      student = Student.new
      allow(student).to receive(:foo) do |arg|
        if arg == :hello
          "Olá!"
        else arg == :hi
          "Hi!"
        end
      end

      expect(student.foo(:hello)).to eq("Olá!")
      expect(student.foo(:hi)).to eq("Hi!")
    end

    it 'Qualquer instância de Classe' do
      student = Student.new
      other_student = Student.new

      allow_any_instance_of(Student).to receive(:bar).and_return(true)
      
      expect(student.bar).to be_truthy
      expect(other_student.bar).to be_truthy
    end

    it 'Erros' do
      student = Student.new

      allow(student).to receive(:bar).and_raise(RuntimeError)
      
      expect{student.bar}.to raise_error(RuntimeError)
    end
  end